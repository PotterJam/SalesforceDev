trigger PaymentArchiveTrigger on Payment_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
