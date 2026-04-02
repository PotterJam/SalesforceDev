trigger PromotionSchemaTrigger on Promotion_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
