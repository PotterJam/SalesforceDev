trigger TargetRelayTrigger on Target_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetRelayHandler.handleAfterDelete(Trigger.old);
    }
}
