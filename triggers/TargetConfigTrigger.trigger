trigger TargetConfigTrigger on Target_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetConfigHandler.handleAfterDelete(Trigger.old);
    }
}
