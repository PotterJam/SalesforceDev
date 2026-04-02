trigger SeverityTransformTrigger on Severity_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityTransformHandler.handleAfterDelete(Trigger.old);
    }
}
