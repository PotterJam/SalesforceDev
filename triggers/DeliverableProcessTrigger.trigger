trigger DeliverableProcessTrigger on Deliverable_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableProcessHandler.handleAfterDelete(Trigger.old);
    }
}
