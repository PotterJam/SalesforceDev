trigger DeliverableActionTrigger on Deliverable_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableActionHandler.handleAfterDelete(Trigger.old);
    }
}
