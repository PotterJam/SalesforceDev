trigger OrderModelTrigger on Order_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderModelHandler.handleAfterDelete(Trigger.old);
    }
}
