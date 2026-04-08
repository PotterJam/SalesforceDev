trigger ImpactRelayTrigger on Impact_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRelayHandler.handleAfterDelete(Trigger.old);
    }
}
