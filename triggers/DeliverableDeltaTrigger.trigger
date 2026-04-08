trigger DeliverableDeltaTrigger on Deliverable_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
