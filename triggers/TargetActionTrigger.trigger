trigger TargetActionTrigger on Target_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetActionHandler.handleAfterDelete(Trigger.old);
    }
}
