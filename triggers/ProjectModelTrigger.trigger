trigger ProjectModelTrigger on Project_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectModelHandler.handleAfterDelete(Trigger.old);
    }
}
