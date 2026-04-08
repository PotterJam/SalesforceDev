trigger TierGatewayTrigger on Tier_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
