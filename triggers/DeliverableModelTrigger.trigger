trigger DeliverableModelTrigger on Deliverable_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableModelHandler.handleAfterDelete(Trigger.old);
    }
}
