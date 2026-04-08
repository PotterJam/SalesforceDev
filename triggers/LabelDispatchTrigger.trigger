trigger LabelDispatchTrigger on Label_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
