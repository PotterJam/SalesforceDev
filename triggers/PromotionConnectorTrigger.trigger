trigger PromotionConnectorTrigger on Promotion_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
