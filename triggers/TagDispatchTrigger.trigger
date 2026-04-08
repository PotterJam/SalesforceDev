trigger TagDispatchTrigger on Tag_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
