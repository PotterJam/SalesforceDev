trigger LeadRelayTrigger on Lead_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRelayHandler.handleAfterDelete(Trigger.old);
    }
}
