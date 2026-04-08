trigger TierConnectorTrigger on Tier_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
