trigger DeliverableBatchTrigger on Deliverable_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableBatchHandler.handleAfterDelete(Trigger.old);
    }
}
