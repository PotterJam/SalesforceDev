trigger SegmentCatalogTrigger on Segment_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
