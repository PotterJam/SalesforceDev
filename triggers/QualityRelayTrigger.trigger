trigger QualityRelayTrigger on Quality_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRelayHandler.handleAfterDelete(Trigger.old);
    }
}
