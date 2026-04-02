trigger PartnerTransactionTrigger on Partner_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
