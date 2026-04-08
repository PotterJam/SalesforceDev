trigger DeliverableDetailTrigger on Deliverable_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableDetailHandler.handleAfterDelete(Trigger.old);
    }
}
