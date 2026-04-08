trigger SupportAggregateTrigger on Support_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
