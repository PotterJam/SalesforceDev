trigger GradeConnectorTrigger on Grade_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
