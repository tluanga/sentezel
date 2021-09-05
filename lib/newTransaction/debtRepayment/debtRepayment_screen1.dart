import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/dateSelectTimeLine_widget.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/debtRepayment/debtRepayment_controller.dart';
import 'package:sentezel/newTransaction/debtRepayment/debtRepayment_model.dart';
import 'package:sentezel/newTransaction/payment/paymentConfirm_modal.dart';
import 'package:sentezel/newTransaction/payment/paymentTransactionModeSelect_modal.dart';
import 'package:sentezel/newTransaction/payment/paymentTypeSelect/transactionTypeOfPaymentSelect_modal.dart';

class DebtRePaymentScreen1 extends HookConsumerWidget {
  const DebtRePaymentScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DebtRepayment currentState = ref.watch(debtRepaymentControllerProvider);
    final setState = ref.watch(debtRepaymentControllerProvider.notifier);
    onCancel() {
      // ref.read(receiptControllerProvider.notifier).reset();
    }
    useEffect(() {
      setState.init();
    }, []);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TopBarWithSaveWidget(
                  title: 'Debt RePayment',
                  onSave: () {
                    onSubmit(ref, context);
                  },
                  onCancel: () {
                    onCancel();
                  },
                ),
                DateSelectTimeLineWidget(
                  initialDate: currentState.date,
                  onDateSelected: (selectedDate) {
                    currentState.date = selectedDate;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //--------------Amount ------------
                    Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: TextFormField(
                        //
                        onChanged: (value) {
                          currentState.amount = int.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Amount',
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    //------------Transaction Mode----
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              PaymentTransactionModeSelectModalBottomSheet(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              EnumToString.convertToString(currentState.mode),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.arrowtriangle_down,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextFormField(
                    initialValue: currentState.particular,
                    onChanged: (value) {
                      currentState.particular = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'particular',
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSubmit(WidgetRef ref, context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => PaymentConfirmationBottomSheet(
        onConfirm: () {
          ref.watch(debtRepaymentControllerProvider.notifier).submit();
        },
        onCancel: () {},
      ),
    );
  }
}
