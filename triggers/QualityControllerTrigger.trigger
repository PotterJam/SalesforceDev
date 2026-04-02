trigger QualityControllerTrigger on Quality_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityControllerHandler.handleAfterDelete(Trigger.old);
    }
}
