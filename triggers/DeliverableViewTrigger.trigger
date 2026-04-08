trigger DeliverableViewTrigger on Deliverable_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableViewHandler.handleAfterDelete(Trigger.old);
    }
}
