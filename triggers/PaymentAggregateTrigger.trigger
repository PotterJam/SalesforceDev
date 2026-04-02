trigger PaymentAggregateTrigger on Payment_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
