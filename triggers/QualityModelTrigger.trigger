trigger QualityModelTrigger on Quality_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityModelHandler.handleAfterDelete(Trigger.old);
    }
}
