trigger PartnerAggregateTrigger on Partner_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
