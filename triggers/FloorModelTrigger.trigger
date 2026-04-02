trigger FloorModelTrigger on Floor_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorModelHandler.handleAfterDelete(Trigger.old);
    }
}
