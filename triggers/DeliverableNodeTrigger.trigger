trigger DeliverableNodeTrigger on Deliverable_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableNodeHandler.handleAfterDelete(Trigger.old);
    }
}
