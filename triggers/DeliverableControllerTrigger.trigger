trigger DeliverableControllerTrigger on Deliverable_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableControllerHandler.handleAfterDelete(Trigger.old);
    }
}
