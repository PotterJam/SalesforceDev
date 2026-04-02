trigger PriorityModelTrigger on Priority_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityModelHandler.handleAfterDelete(Trigger.old);
    }
}
