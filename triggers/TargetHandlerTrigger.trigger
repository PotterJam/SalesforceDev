trigger TargetHandlerTrigger on Target_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
