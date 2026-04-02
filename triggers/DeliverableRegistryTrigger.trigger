trigger DeliverableRegistryTrigger on Deliverable_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
