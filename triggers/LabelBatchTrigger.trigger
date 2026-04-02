trigger LabelBatchTrigger on Label_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelBatchHandler.handleAfterDelete(Trigger.old);
    }
}
