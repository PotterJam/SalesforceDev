trigger ResourceModelTrigger on Resource_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceModelHandler.handleAfterDelete(Trigger.old);
    }
}
