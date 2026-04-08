trigger TargetControllerTrigger on Target_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetControllerHandler.handleAfterDelete(Trigger.old);
    }
}
