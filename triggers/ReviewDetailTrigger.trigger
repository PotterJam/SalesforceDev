trigger ReviewDetailTrigger on Review_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewDetailHandler.handleAfterDelete(Trigger.old);
    }
}
