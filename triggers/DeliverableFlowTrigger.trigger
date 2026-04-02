trigger DeliverableFlowTrigger on Deliverable_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableFlowHandler.handleAfterDelete(Trigger.old);
    }
}
