trigger TargetDispatchTrigger on Target_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
