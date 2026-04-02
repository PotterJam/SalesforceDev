trigger CommissionModelTrigger on Commission_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionModelHandler.handleAfterDelete(Trigger.old);
    }
}
