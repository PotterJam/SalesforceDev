trigger RangeModelTrigger on Range_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeModelHandler.handleAfterDelete(Trigger.old);
    }
}
