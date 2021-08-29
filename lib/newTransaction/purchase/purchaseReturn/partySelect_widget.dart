//  GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (context) => PartySelectModal(
//                               onSelectParty: (party) {
//                                 ref
//                                     .watch(purchaseOfMaterialControllerProvider
//                                         .notifier)
//                                     .setParty(party);
//                               },
//                             ),
//                           );
//                         },
//                         child: Container(
//                           width: data.mode == TransactionMode.credit
//                               ? MediaQuery.of(context).size.width * 0.97
//                               : MediaQuery.of(context).size.width * 0.55,
//                           height: MediaQuery.of(context).size.height * 0.05,
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade300,
//                               borderRadius: BorderRadius.circular(3),
//                               border: Border.all(
//                                 color: data.partyId != 0
//                                     ? Colors.grey.shade300
//                                     : Colors.red.shade300,
//                               )),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 data.partyId == null
//                                     ? 'Please Select Party'
//                                     : ref
//                                         .watch(
//                                             purchaseOfMaterialControllerProvider
//                                                 .notifier)
//                                         .getPartyName(),
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Icon(
//                                 CupertinoIcons.arrowtriangle_down,
//                                 color: Colors.black,
//                                 size: 20,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),