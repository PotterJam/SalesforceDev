trigger CeilingAggregateTrigger on Ceiling_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
