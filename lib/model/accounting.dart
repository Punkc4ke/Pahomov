import 'package:conduit/conduit.dart';
import 'package:api/model/user.dart';

class Accounting  extends ManagedObject<_Accounting> implements _Accounting {}

class _Accounting {

  @primaryKey
  int? id;
  @Column(nullable: false)
  int? number;
  @Column(nullable: false)
  String? name;
  @Column(nullable: false)
  String? description;
  @Column(nullable: false)
  String? category;
  @Column(nullable: false)
  String? dateOfOperation;
  @Column(nullable: false)
  String? transactionAmount;
  @Column(nullable: false)
  bool? deleted;
  @Relate(#accountingList, isRequired: true, onDelete: DeleteRule.cascade)
  User? user;

}