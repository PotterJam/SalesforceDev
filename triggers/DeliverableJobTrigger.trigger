trigger DeliverableJobTrigger on Deliverable_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableJobHandler.handleAfterDelete(Trigger.old);
    }
}
