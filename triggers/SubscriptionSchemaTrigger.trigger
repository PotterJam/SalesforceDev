trigger SubscriptionSchemaTrigger on Subscription_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
