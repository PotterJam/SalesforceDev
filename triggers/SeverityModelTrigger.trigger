trigger SeverityModelTrigger on Severity_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityModelHandler.handleAfterDelete(Trigger.old);
    }
}
