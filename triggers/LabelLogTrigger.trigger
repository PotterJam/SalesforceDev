trigger LabelLogTrigger on Label_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelLogHandler.handleAfterDelete(Trigger.old);
    }
}
