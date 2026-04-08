trigger LabelHandlerTrigger on Label_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
