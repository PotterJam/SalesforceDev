trigger ImpactAggregateTrigger on Impact_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
